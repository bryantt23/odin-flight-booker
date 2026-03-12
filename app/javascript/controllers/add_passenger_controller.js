import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["items"]

    deleteRow(e) {
        e.preventDefault()
        console.log(this.parentNode)
        const passengerFields = this.parentNode.parentNode.parentNode.querySelectorAll(".passenger-field")
        if (passengerFields.length > 1) {
            this.parentNode.remove()
        }
    }

    connect() {
        // this.element.textContent = "Hello World from passenger!!!"
        console.log(this.itemsTarget)
        // debugger
        const passengerFields = this.itemsTarget.parentNode.querySelectorAll(".passenger-field")
        for (const field of passengerFields) {
            const button = document.createElement("button")
            button.addEventListener('click', this.deleteRow)
            button.innerText = "Delete"
            field.appendChild(button)
        }

    }

    addItem(e) {
        e.preventDefault();

        // 1. Create the input element
        const div = document.createElement("div")
        div.className = "passenger-field"
        const inputField = document.createElement('input')
        inputField.setAttribute('type', 'text')
        inputField.setAttribute('name', `booking[passengers_attributes][${Date.now()}][name]`)

        // 2. Create the label element
        const labelElement = document.createElement('label')
        labelElement.textContent = 'Enter name'

        // 3. Associate the label with the input using the htmlFor property
        labelElement.htmlFor = 'name'

        //delete button
        const button = document.createElement("button")
        button.addEventListener('click', this.deleteRow)
        button.innerText = "Delete"

        // 4. Append both to the document body (or another container)
        div.appendChild(labelElement)
        div.appendChild(inputField)
        div.appendChild(button)
        this.itemsTarget.appendChild(div)
    }
}
