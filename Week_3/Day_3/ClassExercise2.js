var nums = '80:70:90:100'

function averageColon(numbers) {

var split_numbers = numbers.split(":");

console.log(split_numbers);

var totalSum = split_numbers.reduce(function(sum, number){
    return parseInt(sum) + parseInt(number);
  })

return totalSum / split_numbers.length;
}

console.log(averageColon(nums));
