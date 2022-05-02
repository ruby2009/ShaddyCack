import { Controller } from '@hotwired/stimulus'
import Inputmask from 'inputmask'

// Connects to data-controller="annual-form"
export default class extends Controller {
  static targets = [ "number" ]

  numberTargetConnected () {
    console.log(this, 'fuck yo couch')
    Inputmask({"mask": "999-999-9999"}).mask(this.numberTarget);
  }
}
