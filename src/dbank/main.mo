import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  // Flexible variables
  // var currentValue = 0;

  // Orthogonal Persistence
  // Stable variables do not loose their value on each deploy
  stable var currentValue: Float = 0;
  stable var startTime = Time.now();

  // Private Functions
  func showValue() {
    Debug.print(debug_show(currentValue));
  };

  // Public Functions
  // To run `dfx canister call dbank topUp '(amount)'`
  public func topUp(amount: Float) {
    compound();
    currentValue += amount;
    showValue();
  };

  public func withdraw(amount: Float) {
    if(currentValue >= amount) {
      compound();
      currentValue -= amount;
      showValue();
    } else {
      Debug.print("Amount too large");
    }
  };

  // Update functions are slow so we can use query functions for read only work
  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsed = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed));
    startTime := Time.now();
  }
}