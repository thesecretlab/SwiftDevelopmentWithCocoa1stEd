// BEGIN noise_shader_impl
void main()
{
    // Get the original color for this pixel
    vec4 color = SKDefaultShading();
    
    // Get the corresponding point in the noise shader
    vec4 noiseSample = texture2D(noiseTexture, v_tex_coord);
    
    // If the noise value is below the threshold,
    // then set the alpha value to 0
    if (noiseSample.a < threshold) {
        color.a = 0.0;
    }
    
    // Premultiply the color channels (red, green, and blue)
    // with the alpha channel
    color.rgb *= color.a;
    
    // Return the finished color
    gl_FragColor = color;
}
// END noise_shader_impl

/*
// BEGIN shader_red
void main()
{
    // Get the original color
    vec4 color = SKDefaultShading();
    
    // Set the color to red
    color = vec4(1.0, 0.0, 0.0, color.a);
 
    // Multiply this by alpha to preserve transparency
    color.rgb *= color.a;

    // Return the finished color
    gl_FragColor = color;
}
// END shader_red
*/