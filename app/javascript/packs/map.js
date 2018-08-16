import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) {
  const markers = JSON.parse(mapElement.dataset.markers);
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}

// map.setCenter({lat:LAT_VALUE, lng:LONG_VALUE});
// -37.823808,
//  longitude: 144.9912611,
