import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "previews", "placeholder", "label"]

  previewMultiple() {
    const files = this.inputTarget.files

    if (files.length > 0 && this.hasPlaceholderTarget) {
        this.placeholderTarget.classList.add("hidden")
    }

    this.previewsTarget.innerHTML = ""

    Array.from(files).forEach((file) => {
        if (!file.type.startsWith("image/")) return

        const reader = new FileReader()
        reader.onload = (e) => {
            const img = document.createElement("img")
            img.src = e.target.result
            img.className = "rounded w-full h-auto object-cover border"
            this.previewsTarget.appendChild(img)
        }
        reader.readAsDataURL(file)
    })
  }
}
