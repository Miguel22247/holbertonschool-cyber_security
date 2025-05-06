class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  def cipher(message, shift)
    message.chars.map do |char|
      if char.match?(/[A-Za-z]/)
        base = char.ord < 91 ? 'A'.ord : 'a'.ord
        ((char.ord - base + shift) % 26 + base).chr
      else
        char
      end
    end.join
  end
end

# Example usage:
# cipher = CaesarCipher.new(3)
# encrypted = cipher.encrypt("Hello, World!")
# puts encrypted # "Khoor, Zruog!"
# decrypted = cipher.decrypt(encrypted)
# puts decrypted # "Hello, World!"