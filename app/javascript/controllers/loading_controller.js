import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["screen"]

  connect() {
    const hasSeenLoading = localStorage.getItem("seenLoading")

    if (!hasSeenLoading) {
      this.screenTarget.classList.remove("hidden")
      setTimeout(() => {
        this.screenTarget.classList.add("hidden")
      }, 1500)

      localStorage.setItem("seenLoading", "true")
    }
  }
}
