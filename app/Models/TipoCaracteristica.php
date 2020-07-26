<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TipoCaracteristica
 * 
 * @property int $idTipoCaracteristica
 * @property string $descripcion
 * @property bool|null $esBit
 * @property bool|null $esNumber
 * @property bool|null $esString
 * @property bool|null $esFecha
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 *
 * @package App\Models
 */
class TipoCaracteristica extends Model
{
	protected $table = 'tipo_caracteristica';
	protected $primaryKey = 'idTipoCaracteristica';
	public $timestamps = false;

	protected $casts = [
		'esBit' => 'bool',
		'esNumber' => 'bool',
		'esString' => 'bool',
		'esFecha' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'descripcion',
		'esBit',
		'esNumber',
		'esString',
		'esFecha',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];
}
