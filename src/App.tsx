import React from "react";
import "./App.css"

interface AppProps {
  text?: string;
}

const App: React.FC<AppProps> = ({ text = "Success" }) => {


  return (
    <div className="tick-container">
    <div className="tick-circle">
      <svg
        width="100"
        height="100"
        viewBox="0 0 100 100"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M30 50 L45 65 L70 35"
          className="tick-path"
          fill="none"
          stroke="var(--secondary-color)"
          strokeWidth="5"
          strokeLinecap="round"
        />
      </svg>
    </div>
    <div className="tick-text">{text}</div>
  </div>
  );
};

export default App;
