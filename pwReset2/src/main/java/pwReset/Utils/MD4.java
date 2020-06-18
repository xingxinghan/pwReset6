package pwReset.Utils;

import java.io.UnsupportedEncodingException;

import org.apache.log4j.Logger;

public class MD4
{
  private static final Logger LOGGER = Logger.getLogger(MD4.class);
  
  private static int A;
  private static int B;
  private static int[] X = new int[16]; private static int C;
  private static int D;
  
  private static int f(int x, int y, int z) { return x & y | (x ^ 0xFFFFFFFF) & z; }


  
  private static int g(int x, int y, int z) { return x & y | x & z | y & z; }


  
  private static int h(int x, int y, int z) { return x ^ y ^ z; }

  
  private static int lshift(int x, int s) {
    if (s == 0) {
      return x;
    }
    return x << s & 0xFFFFFFFF | x >> 32 - s & Integer.MAX_VALUE >> 31 - s;
  }

  
  private static int round1(int a, int b, int c, int d, int k, int s) { return lshift(a + f(b, c, d) + X[k], s); }


  
  private static int round2(int a, int b, int c, int d, int k, int s) { return lshift(a + g(b, c, d) + X[k] + 1518500249, s); }


  
  private static int round3(int a, int b, int c, int d, int k, int s) { return lshift(a + h(b, c, d) + X[k] + 1859775393, s); }




  
  private static void mdfour64(int[] m) {
    for (int j = 0; j < 16; j++) {
      X[j] = m[j];
    }
    
    int aa = A;
    int bb = B;
    int cc = C;
    int dd = D;
    
    A = round1(A, B, C, D, 0, 3);
    D = round1(D, A, B, C, 1, 7);
    C = round1(C, D, A, B, 2, 11);
    B = round1(B, C, D, A, 3, 19);
    A = round1(A, B, C, D, 4, 3);
    D = round1(D, A, B, C, 5, 7);
    C = round1(C, D, A, B, 6, 11);
    B = round1(B, C, D, A, 7, 19);
    A = round1(A, B, C, D, 8, 3);
    D = round1(D, A, B, C, 9, 7);
    C = round1(C, D, A, B, 10, 11);
    B = round1(B, C, D, A, 11, 19);
    A = round1(A, B, C, D, 12, 3);
    D = round1(D, A, B, C, 13, 7);
    C = round1(C, D, A, B, 14, 11);
    B = round1(B, C, D, A, 15, 19);
    
    A = round2(A, B, C, D, 0, 3);
    D = round2(D, A, B, C, 4, 5);
    C = round2(C, D, A, B, 8, 9);
    B = round2(B, C, D, A, 12, 13);
    A = round2(A, B, C, D, 1, 3);
    D = round2(D, A, B, C, 5, 5);
    C = round2(C, D, A, B, 9, 9);
    B = round2(B, C, D, A, 13, 13);
    A = round2(A, B, C, D, 2, 3);
    D = round2(D, A, B, C, 6, 5);
    C = round2(C, D, A, B, 10, 9);
    B = round2(B, C, D, A, 14, 13);
    A = round2(A, B, C, D, 3, 3);
    D = round2(D, A, B, C, 7, 5);
    C = round2(C, D, A, B, 11, 9);
    B = round2(B, C, D, A, 15, 13);
    
    A = round3(A, B, C, D, 0, 3);
    D = round3(D, A, B, C, 8, 9);
    C = round3(C, D, A, B, 4, 11);
    B = round3(B, C, D, A, 12, 15);
    A = round3(A, B, C, D, 2, 3);
    D = round3(D, A, B, C, 10, 9);
    C = round3(C, D, A, B, 6, 11);
    B = round3(B, C, D, A, 14, 15);
    A = round3(A, B, C, D, 1, 3);
    D = round3(D, A, B, C, 9, 9);
    C = round3(C, D, A, B, 5, 11);
    B = round3(B, C, D, A, 13, 15);
    A = round3(A, B, C, D, 3, 3);
    D = round3(D, A, B, C, 11, 9);
    C = round3(C, D, A, B, 7, 11);
    B = round3(B, C, D, A, 15, 15);
    
    A += aa;
    B += bb;
    C += cc;
    D += dd;
    
    A &= 0xFFFFFFFF;
    B &= 0xFFFFFFFF;
    C &= 0xFFFFFFFF;
    D &= 0xFFFFFFFF;
  }

  
  private static void copy64(int[] m, byte[] in, int offset) {
    for (int i = 0; i < 16; i++) {
      m[i] = in[offset + i * 4 + 3] << 24 & 0xFF000000 | in[offset + i * 4 + 2] << 16 & 0xFF0000 | in[offset + i * 4 + 1] << 8 & 0xFF00 | in[offset + i * 4 + 0] & 0xFF;
    }
  }




  
  private static void copy64(int[] m, byte[] in) { copy64(m, in, 0); }

  
  private static void copy4(byte[] out, int offset, int x) {
    out[offset] = (byte)(x & 0xFF);
    out[1 + offset] = (byte)(x >> 8 & 0xFF);
    out[2 + offset] = (byte)(x >> 16 & 0xFF);
    out[3 + offset] = (byte)(x >> 24 & 0xFF);
  }
  
  private static byte[] mdfour(byte[] in) {
    byte[] out = new byte[16];
    byte[] buf = new byte[128];
    int n = in.length;
    int[] m = new int[16];
    int b = n * 8;


    
    A = 1732584193;
    B = -271733879;
    C = -1732584194;
    D = 271733878;
    
    int offset = 0;
    while (n > 64) {
      copy64(m, in, offset);
      mdfour64(m);
      offset += 64;
      n -= 64;
    } 
    int i;
    for (i = 0; i < 128; i++) {
      buf[i] = (i + offset < in.length) ? in[offset + i] : 0;
    }
    buf[n] = Byte.MIN_VALUE;
    
    if (n <= 55) {
      copy4(buf, 56, b);
      copy64(m, buf);
      mdfour64(m);
    } else {
      copy4(buf, 120, b);
      copy64(m, buf);
      mdfour64(m);
      copy64(m, buf, 64);
      mdfour64(m);
    } 
    
    for (i = 0; i < 128; i++) {
      buf[i] = 0;
    }
    copy64(m, buf);
    
    copy4(out, 0, A);
    copy4(out, 4, B);
    copy4(out, 8, C);
    copy4(out, 12, D);
    
    A = B = C = D = 0;
    return out;
  }
  
  private static final char[] HEX_DIGITS = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

  
  private static String toHexString(byte[] b) { return toHexString(b, 0, b.length); }

  
  private static String toHexString(byte[] b, int off, int len) {
    char[] buf = new char[len * 2];
    for (int i = 0, j = 0; i < len; ) {
      int k = b[off + i++];
      buf[j++] = HEX_DIGITS[k >>> 4 & 0xF];
      buf[j++] = HEX_DIGITS[k & 0xF];
    } 
    return new String(buf);
  }
  
  public static String getMD4(String s) {
    try {
      return toHexString(mdfour(s.getBytes("UTF-16LE")));
    } catch (UnsupportedEncodingException e) {
      LOGGER.error(e.getMessage(), e);
      
      return null;
    } 
  }
}