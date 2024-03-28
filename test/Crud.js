const Crud = artifacts.require('crud');

contract('Crud', () => {
    let crud = null;

    // Before running tests, deploy the Crud contract
    before(async () => {
        crud = await Crud.deployed();
    });

    // Test case to create a new user and verify its creation
    it('Should create a new user', async () => {
        await crud.create('Frank'); // Create a new user named 'Frank'
        const user = await crud.read(1); // Read the details of the created user
        assert(user[0].toNumber() === 1); // Assert that the user ID is 1
        assert(user[1] === 'Frank'); // Assert that the user's name is 'Frank'
    });

    // Test case to update an existing user's name and verify the update
    it('Should update a user', async () => {
        await crud.update(1, 'Frankk'); // Update the name of user with ID 1 to 'Frankk'
        const user = await crud.read(1); // Read the details of the updated user
        assert(user[0].toNumber() === 1); // Assert that the user ID is still 1
        assert(user[1] === 'Frankk'); // Assert that the user's name is now 'Frankk'
    });

    // Test case to try updating a non-existing user and verify the error message
    it('Should NOT update a non-existing user', async () => {
        try {
            await crud.update(2, 'Frankkk'); // Try updating a user with ID 2 (non-existing)
        } catch(e) {
            assert(e.message.includes('user does not exist!')); // Assert that the error message contains 'user does not exist!'
            return;
        }
        assert(false); // Fail the test if no error is caught
    });

    // Test case to destroy an existing user and verify its deletion
    it('Should destroy a user', async () => {
        await crud.destroy(1); // Destroy the user with ID 1
        try {
            await crud.read(1); // Try reading the details of the destroyed user
        } catch(e) {
            assert(e.message.includes('user does not exist!')); // Assert that the error message contains 'user does not exist!'
            return;
        }
        assert(false); // Fail the test if no error is caught
    });

    // Test case to try destroying a non-existing user and verify the error message
    it('Should NOT destroy a non-existing user', async () => {
        try {
            await crud.destroy(10); // Try destroying a user with ID 10 (non-existing)
        } catch(e) {
            assert(e.message.includes('user does not exist!')); // Assert that the error message contains 'user does not exist!'
            return;
        }
        assert(false); // Fail the test if no error is caught
    });
});
