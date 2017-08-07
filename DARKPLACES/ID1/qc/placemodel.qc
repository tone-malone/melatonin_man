void() model_touch =
{
local vector v;
local float yaw;
 
if (other.classname != "player")
        return;
if (other.groundentity == self )
        return;
if (other.origin_z + other.mins_z + 0 >= self.absmax_z)
{
        if ((!other.flags & FL_ONGROUND))
        other.flags = other.flags + FL_ONGROUND;
        return;
}
        v = self.origin - other.origin;
        yaw = vectoyaw( v );
        walkmove( yaw, frametime * 0 );
};

/*
Place model code
How to use:
add key "model" with value "path to model"
*/
void() place_model =
{
        self.movetype = MOVETYPE_STEP;
        self.solid = SOLID_BBOX;
        precache_model (self.model);
        setmodel (self, self.model);
        self.skin = 0;
        self.touch = model_touch;
}; 