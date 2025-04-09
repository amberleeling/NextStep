import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  search(event) {
    event.preventDefault()
    const input = event.currentTarget

    // Add a small delay to prevent too many requests
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
      // Focus after the form submission
      input.focus()
    }, 300)
  }
}
