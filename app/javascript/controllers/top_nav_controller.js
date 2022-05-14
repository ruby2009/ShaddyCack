import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="top-nav"
export default class extends Controller {
  static targets = ['hole', 'leadercard']

  showScore () {
    console.log("in show score")
    if(this.holeTarget.classList.contains('hidden')) {
      this.holeTarget.classList.remove('hidden')
      this.leadercardTarget.classList.add('hidden')
    }
  }

  showLeaderboard () {
    if(this.leadercardTarget.classList.contains('hidden')) {
      this.leadercardTarget.classList.remove('hidden')
      this.holeTarget.classList.add('hidden')
    }
  }
}
