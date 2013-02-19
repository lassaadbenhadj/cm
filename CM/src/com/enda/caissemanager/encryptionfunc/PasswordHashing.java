package com.enda.caissemanager.encryptionfunc;

import java.io.UnsupportedEncodingException;
import java.security.*;
import java.util.Arrays;

public class PasswordHashing
{

    MessageDigest messageDigest;

    public PasswordHashing()
    {
        messageDigest = null;
    }

    public byte[] getHashedPassword(String password, byte randomBytes[])
    {
        byte hashedPassword[] = (byte[])null;
        try
        {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(randomBytes);
            messageDigest.update(password.getBytes("UTF-8"));
            hashedPassword = messageDigest.digest();
            
        }
        catch(NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch(UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
        return hashedPassword;
    }

    public boolean verifyPassword(String password, byte encPassword[])
    {
        byte randomBytes[] = new byte[12];
        byte decPassword[] = (byte[])null;
        System.arraycopy(encPassword, 0, randomBytes, 0, randomBytes.length);
        byte decTempPassword[] = getHashedPassword(password, randomBytes);
        decPassword = new byte[randomBytes.length + decTempPassword.length];
        System.arraycopy(randomBytes, 0, decPassword, 0, randomBytes.length);
        System.arraycopy(decTempPassword, 0, decPassword, randomBytes.length, decTempPassword.length);
        return compare(encPassword, decPassword);
    }

    public byte[] createEncryptedPassword(String password)
    {
        byte randomBytes[] = generateRandomBytes();
        byte encPassword[] = (byte[])null;
        byte tempEncPassword[] = getHashedPassword(password, randomBytes);
        encPassword = new byte[randomBytes.length + tempEncPassword.length];
        System.arraycopy(randomBytes, 0, encPassword, 0, randomBytes.length);
        System.arraycopy(tempEncPassword, 0, encPassword, randomBytes.length, tempEncPassword.length);
        return encPassword;
    }

    public boolean compare(byte encPassword[], byte decPassword[])
    {
        return Arrays.equals(encPassword, decPassword);
    }

    public byte[] generateRandomBytes()
    {
        byte randomBytes[] = new byte[12];
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.nextBytes(randomBytes);
        return randomBytes;
    }
     
    
}
