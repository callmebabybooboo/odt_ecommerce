import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="session-validation"
export default class extends Controller {
  static targets = [
    "email", "emailError", 
    "password", "passwordError", 
    "togglePasswordButton"]

    validate(event) {
      let valid = true

      // Emaill validation
      const email = this.emailTarget.value.trim()
      const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    
      if (email === "") {
        this.showError(this.emailErrorTarget, "อีเมลไม่สามารถเว้นว่างได้")
        valid = false
      } else if (!emailPattern.test(email)) {
        this.showError(this.emailErrorTarget, "รูปแบบอีเมลไม่ถูกต้อง เช่น example@gmail.com")
        valid = false
      } else {
        this.hideError(this.emailErrorTarget)
      }

      // Password validation
      const password = this.passwordTarget.value.trim()
      if (password === "") {
        this.showError(this.passwordErrorTarget, "รหัสผ่านไม่สามารถเว้นว่างได้")
        valid = false
      }

      if (!valid) {
        event.preventDefault()
      }
    }
    
    showError(element, message) {
      element.textContent = message
      element.classList.remove("hidden")
    }
      
    hideError(element) {
      element.textContent = ""
      element.classList.add("hidden")
    }

    togglePassword() {
      const input = this.passwordTarget
      const button = this.togglePasswordButtonTarget
  
      if (input.type === "password") {
        input.type = "text"
        button.textContent = "ซ่อน"
      } else {
        input.type = "password"
        button.textContent = "แสดง"
      }
    }
}
