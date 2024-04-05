const SimpleStorage = artifacts.require('SimpleStorage');
//Testing whether it is possible to change the variable through the set function and whether it will return the new value of the variable
contract('SimpleStorage', () => {
    it('Should set the value of data variable', async () => {
        const simpleStorage = await SimpleStorage.deployed();
        await simpleStorage.set('this'); //Using if function to change the variable
        const result = await simpleStorage.get();
        assert(result === 'this'); //Testing whether the value was changed correctly
    });
});