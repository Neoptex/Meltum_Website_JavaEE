function deleteTag(id, idMelt) {
	var span = document.getElementById("span" + id + idMelt);
	span.parentNode.removeChild(span);

	var opt = document.getElementById("opt" + id + idMelt);
	opt.parentNode.removeChild(opt);
}

function addInTagList(idMelt) {
	var value = document.getElementById('valueTag' + idMelt).value;
	var select = document.getElementById('tagList' + idMelt);
	
	var opt = document.createElement('option');
	opt.id = "opt" + value + idMelt;
	opt.appendChild(document.createTextNode(value));
	opt.selected = "selected";
	opt.value = value;
	select.appendChild(opt);

	// span
	var span = document.createElement("span");
	span.id = "span" + value + idMelt;
	span.className = "label label-info";
	var textnode = document.createTextNode(value);
	span.appendChild(textnode);

	// a
	var a = document.createElement("a");
	a.style.textDecoration = "none";
	a.innerHTML = " <i id='"
			+ value
			+ "' class='fa fa-times' onclick='deleteTag(this.id, \"" + idMelt + "\")'></i>";
	span.appendChild(a);

	document.getElementById("tagLabel" + idMelt).appendChild(span);

	document.getElementById('valueTag' + idMelt).value = '';
}