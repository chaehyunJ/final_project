function countHandler(event) {
    const getOperation = event.target.innerHTML
    let getCount;
    if(getOperation == '+') {
       getCount = event.target.nextElementSibling.innerHTML
       getCount = parseInt(getCount) + 1;
       event.target.nextElementSibling.innerHTML = getCount
       }
    else {
       getCount = event.target.previousElementSibling.innerHTML
       getCount = parseInt(getCount) - 1;
       if(getCount <= 0) {
            deleteHandler(event)
           }
           event.target.previousElementSibling.innerHTML = getCount
       }
}

function imageOrderDom(event) {
	console.log(event.target)
    const div = document.createElement('div')
    div.classList.add('child_order')

    const spanmenuname = document.createElement('span')
    spanmenuname.innerText= event.target.nextElementSibling.nextElementSibling.innerText

    const deleteButton = document.createElement('button')
    deleteButton.innerHTML="x"
    deleteButton.classList.add('deleteBtn')

    const plusButton = document.createElement('button')
    plusButton.classList.add('addminusBtn')
    //plusButton.classList.add('plusBtn')
    plusButton.innerHTML="+"

    const span = document.createElement('span')
    span.classList.add('orderCount')
    span.innerHTML="1"

    const minusButton = document.createElement('button')
    minusButton.classList.add('addminusBtn')
    //minusButton.classList.add('minusBtn')
    minusButton.innerHTML="-"

    const spanmenuprice = document.createElement('span')
    spanmenuprice.innerText= event.target.nextElementSibling.innerText



    div.appendChild(deleteButton)
    div.appendChild(spanmenuname)
    div.appendChild(plusButton)
    div.appendChild(span)
    div.appendChild(minusButton)
    div.appendChild(spanmenuprice)

    parent_order.appendChild(div)
}
function deleteHandler(event) {
    console.log(event.target)
        const parent_order = event.target.parentElement.parentElement
        const child_order = event.target.parentElement
        parent_order.removeChild(child_order)
} 