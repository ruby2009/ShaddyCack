import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="geolocation"
export default class extends Controller {
  static targets = ['distance']

  static values = {
    long: String,
    lat: String
  }

  connect () {
    this.geolocate()
  }

  geolocate () {
    let options = { 
      enableHighAccuracy: true,
      timeout: 10000,
      maximumAge: 0
    }

    if (!navigator.geolocation) {
      this.distanceTarget.textContent = "GPS disabled"
    } else {
      navigator.geolocation.watchPosition(
        this.success.bind(this),
        this.error.bind(this),
        options
      )
    }
  }

  error () {
    this.distanceTarget.textContent = "GPS Unavailable"
  }

  success (position) {
    let lon1 = position.coords.longitude
    let lat1 = position.coords.latitude
    let lon2 = this.longValue
    let lat2 = parseFloat(this.latValue)
    console.log("ran")

    var R = 6371; // Radius of the earth in km
    var dLat = ((lat2-lat1) * (Math.PI/180));  // deg2rad below
    var dLon = ((lon2-lon1) * (Math.PI/180)); 
    var a = 
      Math.sin(dLat/2) * Math.sin(dLat/2) +
      Math.cos((lat1 * (Math.PI/180))) * Math.cos((lat2 * (Math.PI/180))) * 
      Math.sin(dLon/2) * Math.sin(dLon/2)
      ; 
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
    var d = R * c; // Distance in km
    var yards = parseInt((d * 3280.84)/3)
    this.distanceTarget.textContent = `${yards} yards to hole`;
  }
}
