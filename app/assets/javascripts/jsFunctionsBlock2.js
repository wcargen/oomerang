///////// Add autocomplete to Places Bar
function autoComp() {
  if(generalMarker!="")
    generalMarker.setMap(null);
  generalMarker = new google.maps.Marker({
    map: map,
    icon: "/assets/MarkerGrey.png",
    animation: google.maps.Animation.DROP,
    draggable: true,
  });
  generalMarker.setVisible(false);  

  input.className = '';
  var place = autocomplete.getPlace();
  if (!place.geometry) {
    // Inform the user that the place was not found and return.
    input.className = 'notfound';
    return;
  }

  // If the place has a geometry, then present it on a map.
  if (place.geometry.viewport) {
    map.fitBounds(place.geometry.viewport);
  } else {
    map.setCenter(place.geometry.location);
    map.setZoom(17);
  }
  generalMarker.setPosition(place.geometry.location);
  generalMarker.setVisible(true);

  // var address = '';
  // if (place.address_components) {
  //   address = [
  //     (place.address_components[0] && place.address_components[0].short_name || ''),
  //     (place.address_components[1] && place.address_components[1].short_name || ''),
  //     (place.address_components[2] && place.address_components[2].short_name || '')
  //   ].join(' ');
  // }
  // var infowindow = new google.maps.InfoWindow();
  // infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);

  var infowindow = new google.maps.InfoWindow();
  infowindow.setContent('<div><strong>Hello!</strong><br>');
  google.maps.event.addListener(generalMarker, 'click', function() {
    if (infowindow.getMap() == null)
      infowindow.open(map,this);
    else
      infowindow.close();
  });
}




