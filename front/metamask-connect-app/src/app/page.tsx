"use client"
import React from 'react';
import MyButton from '../components/MyButton';

const HomePage = () => {
  const handleClick = () => {
    console.log('Button clicked');
  };

  return (
    <div>
      <MyButton onClick={handleClick} />
    </div>
  );
};

export default HomePage;
