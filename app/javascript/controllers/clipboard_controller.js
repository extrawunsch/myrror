import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  copy() {
    console.log("hello")
    this.sourceTarget.select()
    document.execCommand("copy")
  }
}