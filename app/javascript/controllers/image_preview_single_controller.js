import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview", "placeholder"]

  preview() {
    const url = this.inputTarget.value.trim()

    if (!url || !(url.startsWith("http://") || url.startsWith("https://"))) {
      this.previewTarget.innerHTML = ""
      this.placeholderTarget.classList.remove("hidden")
      return
    }

    this.placeholderTarget.classList.add("hidden")
    this.previewTarget.innerHTML = ""

    const img = document.createElement("img")
    img.src = url
    img.className = "rounded w-full h-auto object-cover border"
    this.previewTarget.appendChild(img)
  }
}
