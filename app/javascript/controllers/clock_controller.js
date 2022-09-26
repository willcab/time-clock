import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hours", "minutes","seconds"]

  connect() {
    setInterval(()=>this.time,1000)
  }

  get time(){
    let time = new Date();
    this.hoursTarget.textContent = String(time.getHours()).padStart(2, '0');
    this.minutesTarget.textContent = String(time.getMinutes()).padStart(2, '0');
    this.secondsTarget.textContent = String(time.getSeconds()).padStart(2, '0');
  }
}