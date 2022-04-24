function __input_class_combo_definition(_name) constructor
{
    __name        = _name;
    __phase_array = [];
    
    static __ensure_simple_verb = function(_name)
    {
        if (variable_struct_exists(global.__input_chord_dict, _name))
        {
            __input_error("Combos only accept basic verbs when defining phases. Chord \"", _name, "\" cannot be used");
        }
        
        if (variable_struct_exists(global.__input_combo_dict, _name))
        {
            __input_error("Combos only accept basic verbs when defining phases. Combo \"", _name, "\" cannot be used");
        }
        
        if (!variable_struct_exists(global.__input_verb_dict, _name))
        {
            __input_error("Verb \"", _name, "\" not found. Please define verbs before combos");
        }
    }
    
    static press = function()
    {
        var _verb_array = array_create(argument_count);
        var _verb_struct = {};
        
        var _i = 0;
        repeat(array_length(_verb_array))
        {
            var _verb_name = argument[_i];
            __ensure_simple_verb(_verb_name);
            
            _verb_array[@ _i] = _verb_name;
            _verb_struct[$ _verb_name] = _i;
            
            ++_i;
        }
        
        array_push(__phase_array, {
            __type:  __INPUT_COMBO_PHASE_TYPE.__PRESS,
            __verb_array: _verb_array,
            __verb_struct: _verb_struct,
        });
        
        return self;
    }
    
    static release = function()
    {
        var _verb_array = array_create(argument_count);
        var _verb_struct = {};
        
        var _i = 0;
        repeat(array_length(_verb_array))
        {
            var _verb_name = argument[_i];
            __ensure_simple_verb(_verb_name);
            
            _verb_array[@ _i] = _verb_name;
            _verb_struct[$ _verb_name] = _i;
            
            ++_i;
        }
        
        array_push(__phase_array, {
            __type:  __INPUT_COMBO_PHASE_TYPE.__RELEASE,
            __verb_array: _verb_array,
            __verb_struct: _verb_struct,
        });
        
        return self;
    }
    
    static hold_start = function()
    {
        var _verb_array = array_create(argument_count);
        var _verb_struct = {};
        
        var _i = 0;
        repeat(array_length(_verb_array))
        {
            var _verb_name = argument[_i];
            __ensure_simple_verb(_verb_name);
            
            _verb_array[@ _i] = _verb_name;
            _verb_struct[$ _verb_name] = _i;
            
            ++_i;
        }
        
        array_push(__phase_array, {
            __type:  __INPUT_COMBO_PHASE_TYPE.__HOLD_START,
            __verb_array: _verb_array,
            __verb_struct: _verb_struct,
        });
        
        return self;
    }
}
