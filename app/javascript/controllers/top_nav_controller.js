import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="top-nav"
export default class extends Controller {
  static targets = ['hole', 'leadercard', 'scoreNav', 'leadercardNav']

  showScore () {
    if(this.holeTarget.classList.contains('hidden')) {
      this.holeTarget.classList.remove('hidden')
      this.leadercardTarget.classList.add('hidden')
    }

    if(this.leadercardNavTarget.classList.contains('shadow-inner')) {
      this.leadercardNavTarget.classList.remove('shadow-inner')
      this.scoreNavTarget.classList.add('shadow-inner')
    }
  }

  showLeaderboard () {
    if(this.leadercardTarget.classList.contains('hidden')) {
      this.leadercardTarget.classList.remove('hidden')
      this.holeTarget.classList.add('hidden')
    }

    console.log(this.scoreNavTarget, "score nav?")
    if(this.scoreNavTarget.classList.contains('shadow-inner')) {
      this.scoreNavTarget.classList.remove('shadow-inner')
      this.leadercardNavTarget.classList.add('shadow-inner')
    }
  }
}
