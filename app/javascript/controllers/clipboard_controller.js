import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  copy() {
    this.sourceTarget.select()
    console.log("hello")
    document.execCommand("copy")
  }
}