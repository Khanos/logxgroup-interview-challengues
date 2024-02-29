const path = require('path');
const fs = require('fs');

console.log('Which country received the most red cards per match on average?');

let count = 0;
fs.readFile(path.join(__dirname, 'WorldCupPlayers.csv'), 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }
  count++;
  const linesArray = data.split('\n');
  const countriesWithMaxRedCardsObject = linesArray.reduce((acc, current) => {
    const valuesArray = current.split(',');
    const event = valuesArray[8] || "";
    const country = valuesArray[2];
    if(event.includes('R')) {
      if(acc[country]) {
        acc[country]++; 
      } else {
        acc[country] = 1;
      }
    }
    return acc;
  }, {})
  const maxRed = {
    count: 0,
    country: ''
  }
  for(const item in countriesWithMaxRedCardsObject) {
    if(countriesWithMaxRedCardsObject[item] > maxRed.count) {
      maxRed.count = countriesWithMaxRedCardsObject[item];
      maxRed.country = item;
    }
  }
  console.log(`The country with max red cards is: ${maxRed.country} with ${maxRed.count}`)
});