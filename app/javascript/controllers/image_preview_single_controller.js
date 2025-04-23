import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview", "placeholder"]

  preview() {
    const file = this.inputTarget.files[0]
    if (!file || !file.type.startsWith("image/")) return

    this.placeholderTarget.classList.add("hidden")
    const label = this.inputTarget.previousElementSibling
    if (label && label.tagName === "LABEL") {
      label.textContent = `เลือก 1 ไฟล์: ${file.name}`
    }   

    this.previewTarget.innerHTML = ""
    
    const reader = new FileReader()
    reader.onload = (e) => {
      const img = document.createElement("img")
      img.src = e.target.result
      img.className = "rounded w-full h-auto object-cover border"
      this.previewTarget.appendChild(img)
    }
    reader.readAsDataURL(file)
  }
}
