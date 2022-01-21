function totalfunction(counter) {
	let priceArr = []
	let total = 0
	//
	parent_order.childNodes.forEach(dto=> {
		let price = dto.childNodes[5].innerText.split(' ')[1]  // [\, 2,300] 2,300만 자르기
		price = parseInt(price.replace(/,/g,"")) //2300
		priceArr.push(price)
	})
	if(counter != null) {
		priceArr.push(counter)
	}
//console.log(priceArr)
	for(let i = 0; i<priceArr.length; i++) {
		total += priceArr[i]
	}
	console.log(priceArr)
	getTotalPriceDom(total)
<<<<<<< HEAD
	
=======
	selectproductcount(total)
>>>>>>> 9b87623806eed1a07b477a8833eb3e4bf3831809
}

function getTotalPriceDom(total) {
	console.log(total)
<<<<<<< HEAD
	if(total == 0) {
		totalnotnull.innerHTML = ''
		 total0.innerHTML = "결제하기"
	}
	else {
		total0.innerHTML = ''
		totalnotnull.innerHTML = total + '원 결제하기'
	}
}

function payment(event) {
	
}

=======
	if(total <= 0) {
		 payment.innerHTML = ''
		 payment.innerHTML = "결제하기"
	}
	else {
		payment.innerHTML = ''
		payment.innerHTML = total + ' 원 결제하기'
	}
}

function deleteallHandler(event) {
	productcount1.innerHTML = ''
	productcount1.innerHTML = 0	
	parent_order.innerHTML = ''
	payment.innerHTML = ''
	payment.innerHTML = "결제하기"
}

function selectproductcount(total) {
	let counthap = 0
	parent_order.childNodes.forEach(dto=> {
		let count = dto.childNodes[3].innerText
		productcount1.innerHTML = ''
		if(parseInt(total) <= 0) {
			productcount1.innerHTML = 0
		}
		else {
			counthap += parseInt(count)
			productcount1.innerHTML = counthap
		}
	})
}
>>>>>>> 9b87623806eed1a07b477a8833eb3e4bf3831809
