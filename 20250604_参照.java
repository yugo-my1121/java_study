public class 20250604 {
  // インターフェースは、Interfaceキーワードを使用して定義されます。
interface Audible{
  // インターフェース内には、実装クラスでオーバーライドされるべき抽象メソッドが含まれます。
  // Audibleを実装したクラスは必ずmakeNoise()とsoundFrequency()とsoundLevel()を持つべきです。

  // オブジェクトが生成する音を示すメソッド
  public abstract void makeNoise();

  // オブジェクトが生成する音の平均周波数を返すメソッド
  public abstract double soundFrequency();

  // オブジェクトが生成する音のレベル(デシベル)を返すメソッド
  public abstract double soundLevel();
}

// Person, Horse, Cow, Truck, ViolinはそれぞれAudibleインターフェースを実装します。
// クラスは、インターフェースを実装するためにimplementsキーワードを使用します。

// 例えば、PersonクラスではmakeNoise、soundFrequency、soundLevelメソッドが実装されています。
class Person implements Audible{
  private String firstName;
  private String lastName;
  private double heightM;
  private double weightKg;
  private int age;

  public Person(String firstName, String lastName, double heightM, double weightKg, int age){
      this.firstName = firstName;
      this.lastName = lastName;
      this.heightM = heightM;
      this.weightKg = weightKg;
      this.age = age;
  }

  public String getFullName(){
      return this.firstName + " " + this.lastName;
  }

  public String toString(){
      return this.getFullName() + " who is " + this.heightM + "m tall and weights " + this.weightKg + "kg.";
  }

  // 人が音を立てるときの動作を定義
  public void makeNoise(){
      System.out.println("Hello World!");
  }

  // 人が出す音の周波数を定義。16歳以上とそれ以下で周波数が異なると想定
  public double soundFrequency(){
      return this.age > 16 ? 110 : 130;
  }

  // 人が出す音のレベルを定義。16歳以上とそれ以下でレベルが異なると想定
  public double soundLevel(){
      return this.age > 16 ? 60 : 65;
  }
}

// Horse, Cow, Truck, Violinクラスも同様にAudibleインターフェースを実装しています。
// 各クラスに適したmakeNoise、soundFrequency、soundLevelメソッドが定義されています。
class Horse implements Audible{
  private double weightKg;
  private double soundFrequency = 120;
  private double soundDecibels = 75;

  public Horse(double weightKg){
      this.weightKg = weightKg;
  }

  public String toString(){
      return "This is a horse that weights: " + this.weightKg + "kg";
  }

  public void makeNoise(){
      System.out.println("Neeighh!!");
  }

  public double soundFrequency(){
      return this.soundFrequency;
  }

  public double soundLevel(){
      return this.soundDecibels;
  }
}

class Cow implements Audible{
  private double weightKg;
  private double soundFrequency = 90;
  private double soundDecibels = 70;

  public Cow(double weightKg){
      this.weightKg = weightKg;
  }

  public String toString(){
      return "This is a cow that weights: " + this.weightKg + "kg";
  }

  public void makeNoise(){
      System.out.println("Moooo!!");
  }

  public double soundFrequency(){
      return this.soundFrequency;
  }

  public double soundLevel(){
      return this.soundDecibels;
  }
}

class Truck implements Audible{
  private double weightKg;

  public Truck(double weightKg){
      this.weightKg = weightKg;
  }

  public String toString(){
      return "This is a truck that weights: " + this.weightKg + "kg";
  }

  public void makeNoise(){
      System.out.println("Beep Beep!!");
  }

  public double soundFrequency(){
      return 165;
  }

  public double soundLevel(){
      return 120;
  }
}

class Violin implements Audible{
  private double soundFrequency = 659.3;
  private final static double SOUND_DECIBELS = 95;

  public String toString(){
      return "This is a violin that plays music: ";
  }

  public void makeNoise(){
      System.out.println("Beep Beep!!");
  }

  public double soundFrequency(){
      return this.soundFrequency;
  }

  public double soundLevel(){
      return Violin.SOUND_DECIBELS;
  }
}

class Main{
  // Audibleインターフェースを使用してポリモーフィズムを実現します。この関数は、Audibleを実装している任意のクラスを取り扱えます。
  public static void personInteractsWithObject(Person p, Audible noiseObject){
      System.out.println(p + " will interact with " + noiseObject + " and cause it to make a noise");
      noiseObject.makeNoise();
      System.out.println("The noise was made at " + noiseObject.soundFrequency() + "Hz at a level of " + noiseObject.soundLevel() + "dB");
      System.out.println();
  }

  public static void main(String[] args){
      // オブジェクトの作成
      Person ashley = new Person("Ashley", "William", 1.8, 110, 29);

      // インターフェースを型として使用することで、ポリモーフィズムを利用できます。
      // Audible型として宣言したオブジェクトはAudibleインターフェースで定義されたメソッドのみ使用できます。
      Audible obj1 = new Person("Toshi", "Takemura", 1.7, 105, 41);
      Audible obj2 = new Horse(450);
      Cow obj3 = new Cow(1300);
      Audible obj4 = new Truck(3230.5);
      Violin obj5 = new Violin();

      // 以下では、ashleyがそれぞれのAudibleオブジェクトと対話します。
      personInteractsWithObject(ashley, obj1);
      personInteractsWithObject(ashley, obj2);
      personInteractsWithObject(ashley, obj3);
      personInteractsWithObject(ashley, obj4);
      personInteractsWithObject(ashley, obj5);

      // 特定のメソッド（ここではgetFullName）を呼び出すためには、そのインスタンス（ここではobj1）が適切なクラス（ここではPerson）のインスタンスであることを確認する必要があります。
      if(obj1 instanceof Person) System.out.println("Specific task..." + ((Person) obj1).getFullName());
  }
}
}
