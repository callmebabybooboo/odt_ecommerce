import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview", "placeholder"]

  preview() {
    const url = this.inputTarget.value.trim()

    if (!url || !(url.startsWith("http://") || url.startsWith("https://"))) {
      this.previewTarget.innerHTML = ""
      if (this.hasPlaceholderTarget) {
        this.placeholderTarget.classList.remove("hidden")
      }
      return
    }

    if (this.hasPlaceholderTarget) {
      this.placeholderTarget.classList.add("hidden")
    }
    this.previewTarget.innerHTML = ""

    const img = document.createElement("img")
    img.src = url
    img.className = "rounded w-64 h-auto object-cover border"
    this.previewTarget.appendChild(img)
  }
}
