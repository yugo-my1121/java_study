public class 20250604_ 作成{
interface Fly {

  // 飛ぶオブジェクトの文字を出力
  public abstract void Fly();

  // オブジェクトが何メートル上空まで飛ぶことができるかを返す
  public abstract int FlightHeight();

  // このオブジェクトが秒速何メートルで飛べるかを返す
  public abstract int FlySpeed();
}

class Bird implements Fly {
  private int height; // 飛べる高さ
  private int speed; // 秒速

  public Bird(int speed, int height) {
    this.speed = speed;
    this.height = height;
  }

  public void Fly() {
    System.out.println("Fly is Bird");
  }

  public int FlightHeight() {
    return this.height;
  }

  public int FlySpeed() {
    return this.speed;
  }
}

class Main {
  public static void main(String[] args) {
    Fly obj1 = new Bird(20, 500);
    System.out.println(obj1.FlightHeight());
  }
}}
