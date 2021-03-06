import React, { Component } from 'react';

class Nav extends Component {
  render() {
    const { toggleNote, showNote } = this.props;
    
    return (
      <div className="nav-container">
        <div className="nav-logo">DashNote</div>
        <div className="nav-button" onClick={() => toggleNote()} >
          { showNote ? 'Cancel' :  '+ Note' }
        </div> 
      </div>
    );
  }
}

export default Nav;