import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["shippingFields", "paymentSelect"]

  toggleShipping(event) {
    const method = event.target.value

    if (method === "จัดส่ง") {
      this.shippingFieldsTarget.classList.remove("hidden")
      this.paymentSelectTarget.innerHTML = `
        <option value="โอน">โอน</option>
      `
    } else {
      this.shippingFieldsTarget.classList.add("hidden")
      this.paymentSelectTarget.innerHTML = `
        <option value="เงินสด">เงินสด</option>
        <option value="โอน">โอน</option>
      `
    }
  }
}
