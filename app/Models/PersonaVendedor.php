<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PersonaVendedor
 * 
 * @property int $idPersonaVendedor
 * @property int $idPersona
 * @property string|null $descripcion
 * @property bool $esComisionVenta
 * @property bool $esComisionCobro
 * @property bool $esComisionTabuladorVenta
 * @property bool $esComisionTabuladorCobro
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Persona $persona
 * @property Collection|Venta[] $venta
 *
 * @package App\Models
 */
class PersonaVendedor extends Model
{
	protected $table = 'persona_vendedor';
	protected $primaryKey = 'idPersonaVendedor';
	public $timestamps = false;

	protected $casts = [
		'idPersona' => 'int',
		'esComisionVenta' => 'bool',
		'esComisionCobro' => 'bool',
		'esComisionTabuladorVenta' => 'bool',
		'esComisionTabuladorCobro' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idPersona',
		'descripcion',
		'esComisionVenta',
		'esComisionCobro',
		'esComisionTabuladorVenta',
		'esComisionTabuladorCobro',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function persona()
	{
		return $this->belongsTo(Persona::class, 'idPersona');
	}

	public function venta()
	{
		return $this->hasMany(Venta::class, 'idPersonaVendedor');
	}
}
