# reset_generator (English)

`reset_generator` is a SystemVerilog-based Verification IP (VIP) that provides a flexible and configurable way to generate various reset signals for digital design verification.

## Features

* **Multiple Reset Modes**: Supports various reset signal generation modes, including:
    * Synchronous reset
    * Asynchronous reset
* **Configurable Reset Parameters**: Allows configuration of the following reset signal parameters:
    * Reset pulse width
    * Reset delay
    * Reset polarity
* **Reset Enable Control**: Enables dynamic enabling and disabling of reset signals.
* **Reset Monitoring**: Provides reset signal monitoring to verify reset pulse width and delay against specifications.
* **Reset Fault Injection**: Supports reset fault injection to simulate various fault conditions, such as:
    * Reset pulse width error
    * Reset delay error
    * Reset signal stuck
* **UVM Environment Integration**: Can be easily integrated into a Universal Verification Methodology (UVM) environment.

## Usage

1.  **Clone the Repository**: Clone the GitHub repository to your local machine.
2.  **Compile the Code**: Compile the SystemVerilog code using your SystemVerilog simulator.
3.  **Instantiate the VIP**: Instantiate the `reset_generator` VIP in your verification environment.
4.  **Configure the VIP**: Configure the reset parameters using the rstgen_config.sv.
5.  **Start Reset Generation**: Start the reset generator.
6.  **Monitor Reset Signals**: Use the VIP's monitoring features to verify the reset signals.

## Dependencies

* SystemVerilog simulator
* UVM verification environment (optional)

## License

MIT License

## Contributions

Feel free to submit pull requests to contribute code or fix bugs.

## Contact

For any questions or suggestions, please contact me through GitHub Issues.
