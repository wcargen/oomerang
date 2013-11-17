////////// If the browser doesn't support Geolocation, it renders the San Francisco Map
function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(37.7749300, -122.4194200),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

///////// Displays the markers on the map
function loadMarkers() {

  $.ajax( "/items", {
    type: "get",
    success: function(data){

      //Erase markers from the map to display new ones
      for(var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
      }
      markers=[];
      //Get map bounds to define which markers get displayed
      var bounds = map.getBounds();

      _.each(data,function(item){
        var Marker;
        if(item["lat"]>=0){
          var latTopBound = bounds["fa"]["b"];
          var latBotBound = bounds["fa"]["d"];
        } else {
          var latTopBound = bounds["fa"]["d"];
          var latBotBound = bounds["fa"]["b"];
        }

        if(item["lng"]>=0){
          var lngLeftBound = bounds["ga"]["b"];
          var lngRightBound = bounds["ga"]["d"];
        } else {
          var lngLeftBound = bounds["ga"]["d"];
          var lngRightBound = bounds["ga"]["b"];
        }
        //Check if markers fall inside the window bounds
        if((item["lat"]<latTopBound && item["lat"]>latBotBound) && (item["lng"]<lngLeftBound && item["lng"]>lngRightBound)){
          if(item["status"] == "lost"){
            var image = "/assets/MarkerPurple.png";
          } else{
            var image = "/assets/MarkerWhite.png";
          }
          var Latlng = new google.maps.LatLng(item["lat"],item["lng"]);

          // Markers will only be animated when the map loads the first time
          if(markerflag){
            Marker = new google.maps.Marker({
              position: Latlng,
              animation: google.maps.Animation.DROP,
              icon: image
            });
          } else{
            Marker = new google.maps.Marker({
              position: Latlng,
              icon: image
            });
          }

        // Parsing of the lost or found item's information through a partial before
        //adding it to the infowindow
          var contentString = JST['templates/existingItem']({value: item});

          var infowindow = new google.maps.InfoWindow({
              content: contentString
          });
          google.maps.event.addListener(Marker, 'click', function() {
            if (infowindow.getMap() == null)
              infowindow.open(map,this);
            else
              infowindow.close();
          });
          markers.push(Marker);

        }

      });
      markerflag=false;

      //Set style for the marker clusters
      var clusterStyles = [
        {
          opt_textColor: 'white',
          url: '/assets/MarkerPurple.png',
          height: 43,
          width: 27,
          textSize: 1
        },
       {
          opt_textColor: 'white',
          url: '/assets/MarkerWhite.png',
          height: 43,
          width: 27,
          textSize: 1
        },
       {
          opt_textColor: 'white',
          url: '/assets/MarkerPurple.png',
          height: 43,
          width: 27,
          textSize: 1
        }
      ];
      var mcOptions = {gridSize: 50, styles: clusterStyles, maxZoom: 16};
      var markerCluster = new MarkerClusterer(map, markers, mcOptions);
    }
  });
}


///////// Add a new lost or found item
function addNewItem(event){
  if(generalMarker!="")
    generalMarker.setMap(null);
  var image = "/assets/MarkerGrey.png";
  generalMarker = new google.maps.Marker({
    position: event.latLng,
    map: map,
    draggable: true,
    icon: image
  });


  var lat = event.latLng.lat();
  var lng = event.latLng.lng();

  var contentString = JST['templates/selectItem']();

    var infowindow = new google.maps.InfoWindow({
        content: contentString,
        maxWidth: 500
    });

    google.maps.event.addListener(generalMarker, 'click', function() {
      if (infowindow.getMap() == null)
        infowindow.open(map,this);
      else
        infowindow.close();
    });

    // $('#lost').on('click',function(event){
    //   event.preventDefault();
    //   alert("hello");
    // });

}
