import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="registration-validation"
export default class extends Controller {
  static targets = [
    "email", "emailError", 
    "password", "passwordError", 
    "passwordConfirmation", "passwordConfirmationError",
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
    }else if (password.length < 6) {
      this.showError(this.passwordErrorTarget, "รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร")
      valid = false
    }
    else {
      this.hideError(this.passwordErrorTarget)
    }

    // Confirm Password validation
    const confirmPassword = this.passwordConfirmationTarget.value.trim()
    if (confirmPassword === "") {
      this.showError(this.passwordConfirmationErrorTarget, "กรุณายืนยันรหัสผ่าน")
      valid = false
    } else if (password !== confirmPassword) {
      this.showError(this.passwordConfirmationErrorTarget, "รหัสผ่านไม่ตรงกัน")
      valid = false
    } else {
      this.hideError(this.passwordConfirmationErrorTarget)
    }

    // Prevent form submission if not valid
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

  togglePassword(event) {
    const passwordInput = this.passwordTarget
    const confirmPasswordInput = this.passwordConfirmationTarget
    const button = this.togglePasswordButtonTarget

    const show = passwordInput.type === "password"

    passwordInput.type = show ? "text" : "password"
    confirmPasswordInput.type = show ? "text" : "password"
    button.innerHTML = show ? "ซ่อน" : "แสดง"
  }
}
