module Mode
  class ::Array
    # ön tanımlı mod limiti 1 sayısı
    def  mode(limit=1)
      #her geçerli 
      freq = self.inject(Hash.new(0)) { |hsh,val| hsh[val] += 1; hsh }
      # degerler hash olarak { sayı => tekrar_miktarı } olarak saklanıyor
      mod = freq.values.max # en çok tekrar miktarını max'e ata
      # value' eğer en çok tekrarlanan değere eşitse keyleri çek
      # tekrar miktarı için keys yerine values yazılır 
      keys = freq.select { |_, value| value == mod }.keys
      # eğer değerlerden en küçüğü 1den daha fazla tekrarlanıyorsa dön
      return (mod > limit)? keys: nil;
    end
  end
end

# bu soru ruby de bir çok çeşit yapılabilir

# eğer diziyle bir çözüm isteniyorsa kod daha anlaşılır
# olabilir fakat sistem çok yavaş çalışır. Bu sebepten bu problemi
# mode gibi çözmek daha mantıklı ve daha hızlıdır. 

arr1 = [1, 2, 4, 8, 3]
arr2 = [4, 6, 12, 5, 5, 89]
arr3 = [4, 3, 8, 8, 35, 35, 12]
arr4 = [5, 6, 78, 5]

include Mode

# sonuçlar bir dizi halinde dönüyor. Bunun sonucunda istenilen
# eleman indis erişimyle çekilebiliyor arr2.mode[0] gibi
p arr1.mode
p arr2.mode
p arr3.mode
p arr4.mode