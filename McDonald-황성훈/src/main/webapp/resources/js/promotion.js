function getImageList() {	
		const offset = buttonCount * 6
		const url = cpath + '/getImageList/' + offset
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			const dom = getDom(json)
			result.innerHTML += dom
		})
		buttonCount += 1
		}

function getDom(json) {
	let dom = ''
	json.forEach(dto => {
		dom += `<div class="promotion-imagecontainer">`
		dom += `<img class="promotion-image" src="${dto.image}">`
		dom += `<div class="promotion-sentence">${dto.name}</div>`
		dom += `</div>`
	})
	return dom
}

