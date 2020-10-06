const expect = require('chai').expect;
const myapp = require(".");

describe('Testing printMsg function, should return "Hello World! ver 1.0.1" ', () => {
	it('Should Return Hello World!', () => {
         	expect(myapp.printMsg()).to.equal("Hello World! ver 1.0.1");
	});
});
