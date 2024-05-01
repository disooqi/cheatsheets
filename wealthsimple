table = document.querySelector(".sc-ddc500c2-0.hJKffX")

for(let i=1; i<table.rows.length; i++){
    ret = table.rows[i].cells[2].textContent.split(" ")[0].replace("$", "").replace("−", "-");
    t = parseFloat(ret);
    
    console.log(t);
    sum += t;
}

console.log("Sum of returns", ":", sum);
