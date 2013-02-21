var conditionsArray = Object.prototype.toString.call(conditionsArray) == "[object Array]" ? conditionsArray : [];

for (var i = 0; i < conditionsArray.length; i++) {
    var json = conditionsArray[i].json;
    var containerId = conditionsArray[i].containerId;
    $("#"+containerId).conditionsBuilder(json);
}
