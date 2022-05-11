temp = 0;
id = 0;

function add(){
	newDiv = document.createElement("div");

	colors = ["", "#FFFF00", "#FF00FF", "#FF8C00", "#00FFFF", "#00FF00", "#AA0080"];
	sign = window.prompt("Please enter today's task!","Stay productive");
	if (sign == "" || !sign)
		return ;
	newDiv.classList.add('new');
	newDiv.addEventListener('click', function handleClick() {
		conf = confirm("Confirm delete?");
		if (conf == true)
			this.parentNode.removeChild(this);
	});
	x = 0;
	while (temp == x || x == 0)
		x = Math.floor(Math.random()*6+1);
	console.log(x);
	newDiv.style.background = colors[x];
	temp = x;
	newContent = document.createTextNode(sign);
	newDiv.appendChild(newContent);
	list = document.getElementById('ft_list');
	list.prepend(newDiv);
}