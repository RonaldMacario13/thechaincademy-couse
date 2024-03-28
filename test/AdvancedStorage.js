const AdvancedStorage = artifacts.require('AdvancedStorage');

contract('AdvancedStorage', () => {
    let advancedStorage = null;

    // Before running tests, deploy the AdvancedStorage contract
    before(async () => {
        advancedStorage = await AdvancedStorage.deployed();
    });

    // Test case to verify adding an element to the ids array
    it('Should add an element to ids array', async () => {
        await advancedStorage.add(10); // Add 10 to the ids array
        const result = await advancedStorage.ids(0); // Retrieve the element at index 0
        assert(result.toNumber() === 10); // Assert that the retrieved element is 10
    });

    // Test case to verify getting an element from the ids array
    it('Should get an element of the ids array', async () => {
        await advancedStorage.add(20); // Add 20 to the ids array
        const result = await advancedStorage.get(1); // Retrieve the element at index 1
        assert(result.toNumber() === 20); // Assert that the retrieved element is 20
    });

    // Test case to verify getting the entire ids array
    it('Should get the ids array', async () => {
        const rawIds = await advancedStorage.getAll(); // Get all elements of the ids array
        const ids = rawIds.map(id => id.toNumber()); // Convert BigInts to numbers
        assert.deepEqual(ids, [10, 20]); // Assert that the retrieved array matches [10, 20]
    });

    // Test case to verify getting the length of the ids array
    it('Should get the length of the ids array', async () => {
        const length = await advancedStorage.length(); // Get the length of the ids array
        assert(length.toNumber() === 2); // Assert that the length is 2
    });
});
