import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["items"]

    connect() {
        // this.element.textContent = "Hello World from passenger!!!"
    }


    addItem(e) {
        e.preventDefault();
        const item = document.createElement('li')
        const breakElem = document.createElement("br")
        item.innerText = `hi ${Date.now()}`


        // 1. Create the input element
        const inputField = document.createElement('input')
        inputField.setAttribute('type', 'text')
        inputField.setAttribute('name', `booking[passengers_attributes][${Date.now()}][name]`)

        // 2. Create the label element
        const labelElement = document.createElement('label')
        labelElement.textContent = 'Enter name'

        // 3. Associate the label with the input using the htmlFor property
        labelElement.htmlFor = 'name'

        // 4. Append both to the document body (or another container)
        this.itemsTarget.appendChild(labelElement)
        this.itemsTarget.appendChild(inputField)
        this.itemsTarget.appendChild(breakElem)
    }
}
