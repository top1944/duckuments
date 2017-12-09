webroot = window.location.origin
//bookRoot = "http://book.duckietown.org/master/duckiebook/"

// For a compiled duckiebook, we will use the following
// more general path:
bookRoot = RegExp(/(.+\/).+\.html.+/)
    .exec(window.location.href)[1];

$.expr[':'].Contains = function(a,i,m){
    c = $(a)
        .text()
        .toLowerCase()
        .split(' ')
        .map(x => stemmer(x))
        .join(' ')
        .indexOf(m[3].toLowerCase())>=0;
    return c;
};

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

function emphasizeWord(string, query) {
    var queryStemmed = stemmer(query.toLowerCase());
    var stringArrStemmed = string
        .toLowerCase()
        .split(/ /) 
        .map(x => x.replace(/[^\w]/g, ""))
        .map(x => stemmer(x));
    var stringArr = string.split(" ");

    var emphArr = []

    if (stringArr.length != stringArrStemmed.length) {
        console.log("Arrays have different length. Not emphasizing.");
        return string;
    }
    
    for (var i=0; i<stringArr.length; i++) {
        if (stringArrStemmed[i] == queryStemmed) {
            emphArr.push(`<b>${stringArr[i]}</b>`);
        }
        else {
            emphArr.push(stringArr[i]);
        }
    }
    
    return emphArr.join(" ");
}

searchval = getParameterByName("searchbox");

$.getJSON(webroot + "/secIDs.json", function(json) {
    for (var i in json) {
        var url = getURL(bookRoot, json[i]);
        if (url.includes("undefined")) {
            console.log(json[i]);
        }
    }
})

$.getJSON(webroot + "/index.json", function(json) {
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
        var info = getPageInfo(link, searchval);
    }
    resultdiv.show();
    currentPage = pageToDisplay;
}
