let nowPic;
let check=0;
let envShowContainCount;

function nextSildeHandler(event) {
            if(check <=0 && check > -(envShowContainCount-1) ) { //check의 최대는 -(showContain갯수 -1)
                check -= 1
                nowPic = check * 1000
                showFrame.style.transform='translateX('+nowPic+'px)';
                console.log(check)
            }
            else {  //-2...
                check = 0;
                nowPic = check
                showFrame.style.transform='translateX('+nowPic+'px)';
                console.log(check)
            }
}

function beforeSildeHandler(event) {
    if(check >= 0) {  //젤 처음일때부터 before를 누르면
        if(check == 0) check = -(envShowContainCount-1); {
        nowPic = check * 1000
        showFrame.style.transform='translateX('+nowPic+'px)';
        }
}
}

function macImageHandler() {
	//const url = cpath + '/order/' + cate
	const url = cpath + '/mac'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => render(showFrame,getMacDom(json)))
}


function getMacDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		if(i==0 || i%8==0) tag += showContainTag1
		tag +=	 `<div class="menu-border">`
		tag +=		`<img class="imageOrderBtn" src="${dto.mcmorning_image}">`
		tag +=		`<div>￦ ${dto.mcmorning_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
		tag +=		`<span>${dto.mcmorning_name}</span>`
		tag +=	 `</div>`
		i++
		if(i%8 ==0) tag += showContainTag2
	}) 
	return tag
}

function macSetImageHandler() {
	//const url = cpath + '/order/' + cate
	const url = cpath + '/macSet'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => {
		console.log(json)
		render(showFrame,getMacSetDom(json))
		const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
		console.log(imageOrderBtn)
	    imageOrderBtn.forEach(arr=>{
	    	arr.onclick=function(event) {
	    		imageOrderDom(event)
	    	}
	    })
	})
}


function getMacSetDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		if(i==0 || i%8==0) tag += showContainTag1
		if(dto.mcmorning_set_image != 'null' ) {
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${dto.mcmorning_set_image}">`
			tag +=		`<div>￦ ${dto.mcmorning_set_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span>${dto.mcmorning_set_name}</span>`
			tag +=	 `</div>`
			i++
		}
		if(i%8 ==0) tag += showContainTag2
	}) 
	return tag
}

function burgerImageHandler() {
	console.log(check)
	//const url = cpath + '/order/' + cate
	const url = cpath + '/burger'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => render(showFrame,getburgerDom(json)))
}

function getburgerDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		if(i==0 || i%8==0) tag += showContainTag1
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${dto.burger_image}">`
			tag +=		`<br>￦ ${dto.burger_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}<br>`
			tag +=		`<span>${dto.burger_name}</span>`
			tag +=	 `</div>`
			i++
		if(i%8 ==0) tag += showContainTag2
	}) 
	return tag
}

function burgerSetImageHandler() {
	console.log(check)
	//const url = cpath + '/order/' + cate
	const url = cpath + '/burgerSet'
	const opt = {
			method: 'GET'
	}
	fetch(url,opt)
	.then(resp => resp.json())  //db에 있는 값이 알아서 json으로 바뀜
	.then(json => {
		render(showFrame,getburgerSetDom(json))
		const imageOrderBtn = document.querySelectorAll('.imageOrderBtn')
		console.log(imageOrderBtn)
	    imageOrderBtn.forEach(arr=>{
	    	arr.onclick=function(event) {
	    		imageOrderDom(event)
	    	}
	    })
	})
}

function getburgerSetDom(json) {
	let tag = ``
	let i = 0
	showContainTag1 = `<div class="show-contain">`
	showContainTag2= `</div>`
	json.forEach(dto =>{
		flag = dto.burger_set_image != 'null'
		if(i==0 || i%8==0 && flag) tag += showContainTag1 
		if(dto.burger_set_image != 'null' ) {
			tag +=	 `<div class="menu-border">`
			tag +=		`<img class="imageOrderBtn" src="${dto.burger_set_image}">`
			tag +=		`<div>￦ ${dto.burger_set_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</div>`
			tag +=		`<span>${dto.burger_set_name}</span>`
			tag +=	 `</div>`
			i++
		}
		if(i==0 || i%8==0 && flag) tag += showContainTag2
	}) 
	return tag
}


function render(target, dom) {
	target.innerHTML = dom
	const showContainCount = document.getElementsByClassName('show-contain').length
	showFrame.style.width=showContainCount*1000+'px'
	envShowContainCount = showContainCount //전역변수화
}

