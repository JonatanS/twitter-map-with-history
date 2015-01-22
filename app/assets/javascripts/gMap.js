//http://stackoverflow.com/questions/23354358/how-do-i-load-google-maps-external-javascript-after-page-loads

//Data points defined as a mixture of WeightedLocation and LatLng objects 
var heatMapData = [];
var heatMapFromTwitter = [];

function map_range(value) {
    var from_low = 100;
    var from_high = 3000;
    var to_low = 10;
    var to_high  = 3; 
    var result = to_low + (to_high - to_low) * (value - from_low) / (from_high - from_low);
    result -=1;
    if (result<3) result = 3;
    if (result > 14) result = 14;
    alert(result);
    return result;
}

 function radiusToZoom(radius){
    return Math.round(14-Math.log(radius)/Math.LN2);
}

function initializeMap() {

  var tweetLocationData = twitterResponse;
  //twitterResponse[0] to center the map

  var mapOptions = {
      center: new google.maps.LatLng(tweetLocationData[0].latitute, tweetLocationData[0].longitude),
      //mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeId: google.maps.MapTypeId.SATELLITE,
      //num_retweets contains the radius value. used to control zoom
      //zoom: Math.round(map_range(gon.initLocation.num_retweets)),
      zoom: radiusToZoom(tweetLocationData[0].num_retweets),
      navigationControl: true,
      navigationControlOptions:{
          style: google.maps.NavigationControlStyle.SMALL
      },
      mapTypeControl: true,
      mapTypeControlOptions:{
          style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
      }
      //styles: [{"featureType":"administrative","stylers":[{"visibility":"on"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}]
  };

  var mapDiv = document.getElementById('map-canvas');
  var map = new google.maps.Map(mapDiv, mapOptions);

  var arrayLength = tweetLocationData.length;
  //ignore twitterResponse[0]
for (var i = 1; i < arrayLength; i++) {
    //var tweetJson = '{location: + new google.maps.LatLng(' + tweetLocationData[i].latitute + ',' + tweetLocationData[i].longitude + '), weight: 1}';
    var tweetJson = {location: new google.maps.LatLng(tweetLocationData[i].latitute, tweetLocationData[i].longitude), weight: 5 + tweetLocationData[0].num_retweets/50 + tweetLocationData[i].num_retweets};
    heatMapFromTwitter.push(tweetJson);
}
  //alert("heatMapSize: " + heatMapFromTwitter.length.toString());

    // create map layers
    //Layer = new google.maps.visualization.HeatmapLayer({data: heatMapData});
    Layer = new google.maps.visualization.HeatmapLayer({data: heatMapFromTwitter});

    updateLayerQuery(Layer);
    Layer.setMap(map);

}

// determines what data from twitter querry Geolocation
function updateLayerQuery(layer) {
    layer.setOptions({
            data: heatMapFromTwitter
        })
}


// var ready // Where to store the function
    
//   ready = function() {
//     var script = document.createElement('script');
//     script.type = 'text/javascript';
//     //call initialize here
//     script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' + 'libraries=places,visualization&'+'callback=initialize';
//     document.body.appendChild(script);
//   };
  
