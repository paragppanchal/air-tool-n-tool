import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) {
  const markers = JSON.parse(mapElement.dataset.markers);
  // comment line above, uncomment 2 lines below
  // const markers = [];
  // markers.push({ lat: 61.569481, lng: 16.502020});

  console.log(markers);
  const bounds = new google.maps.LatLngBounds();

  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markerObjs = map.addMarkers(markers);
  console.log(markerObjs);

  // for (let i = 0; i < markers.length; i++) {
  //   bounds.extend(markers[i]);
  // }

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(new google.maps.LatLng(-37.823808, 144.9912611));
    map.setZoom(14);

  } else {
    map.fitBounds(bounds);
    map.panToBounds(bounds);
  }

  markerObjs.forEach((markerObject) => {
    google.maps.event.addListener(markerObject,'click',function() {
      map.setZoom(15);
      // console.log(markerObject);
      // window.markerObject = markerObject;
      map.setCenter(markerObject.position.lat(), markerObject.position.lng());
    });
  })
}


// 61.569481, 16.502020



// google.maps.event.addListener(markers,'click',function() {
//   map.setZoom(9);
//   map.setCenter(markers.getPosition());
//   });




// map.setCenter({lat:LAT_VALUE, lng:LONG_VALUE});
//  latitude: -37.823808,
//  longitude: 144.9912611,





