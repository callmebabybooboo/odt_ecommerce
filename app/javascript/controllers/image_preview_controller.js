import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inputs", "input", "previews"]

  preview() {
    this.renderPreviews()
  }

  addInput() {
    if (this.inputTargets.length >= 6) {
      alert("คุณสามารถเพิ่มรูปภาพได้สูงสุด 6 รูปเท่านั้นค่ะ")
      return
    }
    
    const inputGroup = document.createElement("div")
    inputGroup.className = "flex gap-2 items-center mt-2"

    inputGroup.innerHTML = `
      <input type="text"
        name="product[images_urls][]"
        placeholder="วางลิงก์ URL รูปสินค้า"
        class="w-full p-3 border rounded-lg"
        data-action="input->image-preview#preview"
        data-image-preview-target="input">
      <button type="button" class="px-3 py-2 bg-red-500 text-white rounded" data-action="click->image-preview#removeInput">ลบ</button>
    `
    this.inputsTarget.appendChild(inputGroup)
  }

  removeInput(event) {
    const inputGroup = event.currentTarget.parentElement
    inputGroup.remove()
    this.renderPreviews()
  }

  renderPreviews() {
    this.previewsTarget.innerHTML = ""

    this.inputTargets.forEach(input => {
      const url = input.value.trim()
      if (url.startsWith("http://") || url.startsWith("https://")) {
        const img = document.createElement("img")
        img.src = url
        img.className = "rounded w-full h-auto object-cover border"
        this.previewsTarget.appendChild(img)
      }
    })
  }
}
