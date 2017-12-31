// If testing from localhost:8000/results.html, we hardcode
// the path.
if (window.location.pathname == "/search-bar/content/results.html") {
    bookRoot = "http://book.duckietown.org/master/duckiebook/"
    webroot = window.location.origin + "/search-bar/out/"
}
else {
    regex = new RegExp(/(.*\/).+\.html.*/);
    webroot = regex.exec(window.location.href)[1];
    bookRoot = webroot;
}

var MAX_SAMPLE_LEN = 360;
var WORDS_AROUND = 7;
var MAX_NUM_SAMPLES = 4;
var MIN_QUERY_WORD_LEN = 3;

function stemWords(string) {
    return string
        .toLowerCase()
        .split(/\s+/)
        .map(x => stemmer(x));
}

function stemWordsOnly(string) {
    return string
        .toLowerCase()
        .split(/[^\w]+/)
        .map(x => stemmer(x));
}

$.expr[':'].Contains = function(a,i,m) {
    query = stemWordsOnly(m[3]);
    text = stemWordsOnly($(a).text())
        .join(' ');
    for (var i=0; i<query.length; i++) {
        contains = text.indexOf(query[i]) >= 0;
        if (contains) {
            return true;
        }
    }
    return false;
}

// get parameter from query string
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

// process page and display result
function getPageInfo(url, query) {
    $.ajax({
        url: url,
        success: function(data, status, xhr) {
            var obj = $.parseHTML(data)
            var pageDiv = $.grep($(obj), 
                function(e) {return e.id=="not-toc";})[0];
            var pageTitle = $('h1', pageDiv).text();

            var sample = getFullSample($(pageDiv), query);

            resultdiv = $('#searchresults');
            var searchitem = 
            `<h3> <a href="${url}"> ${pageTitle} </a></h3>
            <p class="resultP">${sample}</p>`;

            resultdiv.append(searchitem);
        },
        error: function(error) {
            console.log(error);
        }
    });
}

function findSubarray(arr, subarr) {
    for (var i = 0; i < 1 + (arr.length - subarr.length); i++) {
        var j = 0;
        for (; j < subarr.length; j++)
            if (arr[i + j] !== subarr[j])
                break;
        if (j == subarr.length)
            return i;
    }
    return -1;
}

function getSampleAllWords(obj, query) {
    var containingText = $(`:Contains(${query})`, obj).text();
    var textArr = containingText.split(/\s+/);
    var stemmedTextArr = stemWords(containingText);
    var stemmedQueryArr = stemWordsOnly(query);
    var numQWords = stemmedQueryArr.length;

    sampleSet = new Set()
    while (textArr.length > 0) {
        if (sampleSet.size == MAX_NUM_SAMPLES) {
            break;
        }
        var wordIndex = findSubarray(stemmedTextArr, stemmedQueryArr);
        if (wordIndex < 0) {
            break;
        }
        var beginPrefix = Math.max(0, wordIndex - WORDS_AROUND)
        var endSuffix = Math.min(wordIndex + numQWords + WORDS_AROUND, textArr.length);
        var prefix = textArr
            .slice(beginPrefix, wordIndex)
        prefix = prefix.join(' ');
        var words = textArr
            .slice(wordIndex, wordIndex + numQWords)
            .join(' ');
        var suffix = textArr
            .slice(wordIndex + numQWords, endSuffix)
            .join(' ');
        phrase = `${prefix} ${words} ${suffix}`;
        
        sampleSet.add(phrase);
    
        var lenPhrase = wordIndex + numQWords + endSuffix;
        textArr = textArr.slice(lenPhrase);
        stemmedTextArr = stemmedTextArr.slice(lenPhrase);
    }
    return sampleSet;
}

function matchingWords(wordArr, wordDict) {
    matches = []
    for (var i in wordArr) {
        if (wordArr[i] in wordDict) {
            matches.push(wordArr[i]);
        }
    }
    return matches;
}

function addToSampleSet(sampleSet, sideSet, stemmedQueryDict, phrase) {
    var phraseArr = stemWordsOnly(phrase);
    var matches = matchingWords(phraseArr, stemmedQueryDict);
    if (matches.length == 0) {
        sideSet.add(phrase);
    }
    else {
        for (var i in matches) {
            delete stemmedQueryDict[matches[i]];
        }
        sampleSet.add(phrase);
    }
}

function getValues(dictionary) {
    var values = Object.keys(dictionary).map(function(key){
        return dictionary[key];
    });
    return values;
}

function getSampleEveryWord(obj, query) {
    var stemmedQueryArr = stemWordsOnly(query);
    var stemmedQueryDict = {};
    var queryWords = query.split(/[^\w]/);
    for (var i in queryWords) {
        var word = queryWords[i]
        stemmedQueryDict[stemmer(word)] = word;
    }

    var containingText = $(`:Contains(${query})`, obj).text();
    var textArr = containingText.split(/\s+/);
    var stemmedTextArr = textArr
        .map(x => stemWordsOnly(x));
    
    var sampleSet = new Set();
    var sideSet = new Set();
    var mostRecentSample = null;
    while (textArr.length > 0) {
        var i = 0;
        while (i < stemmedTextArr.length && !matchesAny(stemmedTextArr[i], stemmedQueryArr)) {
            i++;
        }
        var firstIndex = i;
        var wordGap = 0;
        while (i < stemmedTextArr.length && wordGap < WORDS_AROUND) {
            if (!matchesAny(stemmedTextArr[i], stemmedQueryArr)) {
                wordGap++;
                continue;
            }
            else {
                wordGap = 0;
            }
            i++;
        }
        var lastIndex = i;
        if (sampleSet.size > 0 && firstIndex < WORDS_AROUND) {
            var phrase = textArr.slice(0, lastIndex).join(' ');
            if (mostRecentSample) {
                mostRecentSample += " " + phrase;
            }
            else {
                mostRecentSample = phrase;
            }
        }
        else {
            if (sampleSet.size == MAX_NUM_SAMPLES) {
                break;
            }
            firstIndex = Math.max(0, firstIndex - WORDS_AROUND)
            lastIndex = Math.min(lastIndex + WORDS_AROUND, textArr.length);
            var phrase = textArr.slice(firstIndex, lastIndex).join(' ');
            if (mostRecentSample) {
                addToSampleSet(sampleSet, sideSet, stemmedQueryDict, phrase);
            }
            mostRecentSample = phrase;
        }
        textArr = textArr.slice(lastIndex);
        stemmedTextArr = stemmedTextArr.slice(lastIndex);
    }
    if (mostRecentSample) {
        addToSampleSet(sampleSet, sideSet, stemmedQueryDict, phrase);
    }
    var sideArr = Array.from(sideSet);
    while (sampleSet.size < MAX_NUM_SAMPLES && sideArr.length > 0) {
        sampleSet.add(sideArr.pop());
    }
    var queryWordsLeft = getValues(stemmedQueryDict);
    return [sampleSet, queryWordsLeft];
}

function matchesAny(wordArr, array) {
    for (var j=0; j<wordArr.length; j++) {
        for (var i=0; i<array.length; i++) {
            if (wordArr[j] == array[i]) {
                return true;
            }
        }
    }
    return false;
}


function getFullSample(obj, query) {
    var sampleSet = getSampleAllWords(obj, query);
    
    var samples = getSampleEveryWord(obj, query);
    var sampleArrEvery = Array.from(samples[0]);
    while (sampleSet.size < MAX_NUM_SAMPLES && sampleArrEvery.length > 0) {
        var nextSample = sampleArrEvery.pop();
        sampleSet.add(nextSample);    
    }

    // console.log(sampleSet);

    var sampleArr = Array.from(sampleSet);
    if (sampleArr.length > MAX_NUM_SAMPLES) {
        sampleArr = sampleArr.slice(0,MAX_NUM_SAMPLES);
    }
    sample = sampleArr
        .join("... ") + "...";
    sample = sample.replace(/prevnext|(Because )?(of )?mathjax bug/g,'')
        .replace(/[✎🔗\s]+/g,' ');
    sample = emphasizeWords(sample, query);
    if (Object.keys(samples[1]).length > 0) {
        var notFound = samples[1]
            .map(x => "<s>" + x + "</s>")
            .join(" ")
        missing = `<p> Missing: ${notFound}</p>`
        sample += missing;
    }
    return sample;
}

// Make a string bold from the first alphanumeric character to
// the last. 
function boldenInsideLetters(string) {
    var regex = new RegExp(/(\w.+\w)/);
    var match = regex.exec(string)[1];
    var split = string.split(match);
    if (split.length != 2) {
        console.log("Error making string bold.")
        return string;
    }
    return `${split[0]}<b>${match}</b>${split[1]}`;
}


// Make occurrences of words related to the query through stemming bold.
function emphasizeWords(string, query) {
    var queryStemmed = stemWords(query);
    var stringArrStemmed = string
        .toLowerCase()
        .split(/\s/) 
        .map(x => x.split(/[^\w]/)
            .map(y => stemmer(y)));
    var stringArr = string.split(/\s/);

    var emphArr = []

    if (stringArr.length != stringArrStemmed.length) {
        console.log("Arrays have different length. Not emphasizing.");
        return string;
    }
    
    for (var i=0; i<stringArr.length; i++) {
        if (matchesAny(stringArrStemmed[i], queryStemmed)) {
            emphArr.push(boldenInsideLetters(stringArr[i]));
        }
        else {
            emphArr.push(stringArr[i]);
        }
    }
    
    return emphArr.join(" ");
}


// Get URL of link from a root URL and a section ID.
function getURL(webroot, secID) {
    //return webroot + secID.replace(/-/g, "_") + ".html";
    if (secID in id2fragment) {
        fragment = id2fragment[secID];
        filename = links[fragment];
        link = filename + '#' + fragment;
        return webroot + link;
    }
    else {
        console.log(secID);
        return null;
    }
}

// Test URLs obtained from toURL on functions in a JSON file.
function checkURLs(jsonfile) {
    $.getJSON(webroot + jsonfile, function(json) {
        console.log(json.length.toString() + " section IDs");
        for (var i in json) {
            var url = getURL(bookRoot, json[i]);
        }
    });
}

checkURLs("secIDs.json");

// Display results 1-10 and links to show other sets of 10
function findResults() {
    $.getJSON(webroot + "index.json", function(json) {
        idx = lunr.Index.load(json);
        result = idx.search(searchval);
        $('#searchbox').val(searchval);

        var resultdiv = $('#searchresults');
        var numResults = result.length;
        if (numResults === 0) {
            // Hide results
            $("#showing")
                .append(`<p>No results found for <b>${searchval}</b>.</p>`);
            resultdiv.hide();
        } else {
            // Show result
            resultdiv = $('#searchresults');
            resultdiv.empty();
            var MAX_RESULTS_LEN = 10;
            resArray = []
            for (var i=0; i<numResults; i+=MAX_RESULTS_LEN) {
                resArray.push(result.slice(i, 
                    Math.min(i+MAX_RESULTS_LEN,numResults)));
            }
            currentPage = 0;
            numPages = numResults / MAX_RESULTS_LEN;
            for (var i=0; i<numPages; i++) {
                var span = `<span id="result${i}span" 
                    style="display:inline-block; padding:10px;">
                    </span>`
                var show = `<a class="pageNumLink" id="link${i}"
                    onclick="displayResults(${i},${numResults})" 
                    href="javascript:void(0);">${i+1}</a>`
                $('#pageLinks').append(span);
                $(`#result${i}span`).append(show);
            }
            displayResults(currentPage, numResults);
        }
    });
}

// Display results for a given block of 10
function displayResults(pageToDisplay, numResults) {
    var resultdiv = $('#searchresults');
    $(`#link${currentPage}`).removeClass('thisPageNumLink');
    $(`#link${pageToDisplay}`).addClass('thisPageNumLink');
    result = resArray[pageToDisplay];
    var numToDisplay = result.length;
    var msg = `<p> <em> 
        Showing items ${pageToDisplay*10+1} to 
        ${pageToDisplay*10+result.length} of 
        ${numResults} results </em></p>`;
    $('#showing').html(msg);
    resultdiv.empty();
    for (var item in result) {
        var ref = result[item].ref;
        var link = getURL(bookRoot, ref);
        if (link) {
            var info = getPageInfo(link, searchval);
        }
    }
    resultdiv.show();
    currentPage = pageToDisplay;
}

// get parameter from searchbox
searchval = getParameterByName("searchbox");
console.log(searchval)

// perform search and display
if (searchval && searchval != "") {
    findResults();
}
else {
    console.log("no query; redirecting")
    window.location.replace("search.html");
}