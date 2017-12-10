var regex = new RegExp(/(.+\/)(search)?.+\.html.+/)
webroot = regex.exec(window.location.href)[1];

// If testing from localhost:8000/results.html, we hardcode
// the path.
if (window.location.pathname == "/search-bar/results.html") {
    bookRoot = "http://book.duckietown.org/master/duckiebook/"
}
else {
    bookRoot = webroot;
}

// filter for containing a word whose stemm is the same as the input's stem
$.expr[':'].Contains = function(a,i,m){
    c = $(a)
        .text()
        .toLowerCase()
        .split(' ')
        .map(x => stemmer(x))
        .join(' ')
        .indexOf(stemmer(m[3].toLowerCase()))>=0;
    return c;
};

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

MAX_SAMPLE_LEN = 360

// process page and display result
function getPageInfo(url, query) {
    $.ajax({
        url: url,
        success: function(data, status, xhr) {
            var obj = $.parseHTML(data)
            var pageDiv = $.grep($(obj), 
                function(e) {return e.id=="not-toc";})[0];
            var pageTitle = $('h1', pageDiv).text();
            var sample = getSample($(pageDiv), query);
            var emphasized = emphasizeWord(sample, query);
            resultdiv = $('#searchresults');
            var searchitem = 
            `<h3> <a href="${url}"> ${pageTitle} </a></h3>
            <p class="resultP">${emphasized}</p>`;

            resultdiv.append(searchitem);
        },
        error: function(error) {
            console.log(error);
        }
    });
}

// Obtain text to display for a page. This takes advantage of the
// fact that most text seems to be in "without-header-inside" divs.
// If nothing is found in those divs, we look at the entire page.
function getSample(obj, query) {
    var sections = $('.without-header-inside', obj);
    var containsWord = $(`:Contains("${query}")`, sections);
    var sample = "";
    for (var i=0; i<containsWord.length; i++) {
        var containingText = $(containsWord[i])
           .text();        
        sample += containingText + "... ";
        if (sample.length >= MAX_SAMPLE_LEN) {
            break;
        }
    }
    sample = sample.substr(0, sample.length-3);
    if (sample == "") {
        sample = getSampleFromObj(obj, query);
    }
    if (sample.length > MAX_SAMPLE_LEN) {
        sample = sample.substr(0, MAX_SAMPLE_LEN);
        sample = sample.substr(0, 
            Math.min(sample.length, sample.lastIndexOf(" ")));
    }
    if (sample.substr(-1) != '.') {
        sample += "...";
    }
    return sample;
}

// Look for sample text for query in entire page.
function getSampleFromObj(obj, query) {
    sample = "";
    containingText = $(`:Contains("${query}")`, obj).text();
    var lowerArr = containingText.toLowerCase().split(' ');
    var lowerQuery = query.toLowerCase();
    var index = null;
    for (var i=0; i<lowerArr.length; i++) {
        if (lowerArr[i].includes(lowerQuery)) {
            index = i; 
            break;
        }
    }
    if (!index) {
        console.log("query not found");
        return "..."
    }
    var MAX_NUM_WORDS = 60;
    var first_index = Math.max(index-5, 0);
    var textArr = containingText.split(" ");
    var text = textArr
        .slice(first_index, textArr.length)
        .join(" ")
        .replace(/[✎🔗]+/g, '...')
        .replace(/prevnext|Because of mathjax bug/g," ");

    sample += text + "...";
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
function emphasizeWord(string, query) {
    var queryStemmed = stemmer(query.toLowerCase());
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
        if (stringArrStemmed[i].includes(queryStemmed)) {
            emphArr.push(boldenInsideLetters(stringArr[i]));
        }
        else {
            emphArr.push(stringArr[i]);
        }
    }
    
    return emphArr.join(" ");
}

// Get URL of link from a root URL and a section ID.
function toURL(webroot, secID) {
    return webroot + secID.replace(/-/g, "_") + ".html";
}

// Test URLs obtained from toURL on functions in a JSON file.
function checkURLs(jsonfile) {
    $.getJSON(webroot + jsonfile, function(json) {
        console.log(json.length.toString() + " section IDs");
        for (var i in json) {
            var url = toURL(bookRoot, json[i]);
            $.get(url, function(data){});
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
        if (result.length === 0) {
            // Hide results
            resultdiv.hide();
        } else {
            // Show result
            resultdiv = $('#searchresults');
            resultdiv.empty();
            var numResults = result.length
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
        var link = toURL(bookRoot, ref);
        var info = getPageInfo(link, searchval);
    }
    resultdiv.show();
    currentPage = pageToDisplay;
}

// get parameter from searchbox
searchval = getParameterByName("searchbox");

// perform search and display
if (searchval) {
    findResults();
}